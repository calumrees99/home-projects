param project string 
// Parameters
param environment string 
param location string 
param sku string
param repositoryUrl string 
param linuxFxVersion string 
param branch string 
param name_prefix string = '${project}-${environment}-${location}'
// param name_prefix_no_space string = '${project}${environment}${location}'

// Variables
var appServicePlanName = toLower('${name_prefix}-app-plan')
var webSiteName = toLower('${name_prefix}-app')

resource appServicePlan 'Microsoft.Web/serverfarms@2020-06-01' = {
  name: appServicePlanName
  location: location
  properties: {
    reserved: true
  }
  sku: {
    name: sku
  }
  kind: 'linux'
}

resource appService 'Microsoft.Web/sites@2020-06-01' = {
  name: webSiteName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: linuxFxVersion
    }
  }
}

resource srcControls 'Microsoft.Web/sites/sourcecontrols@2021-01-01' = {
  name: '${appService.name}/web'
  properties: {
    repoUrl: repositoryUrl
    branch: branch
    isManualIntegration: true
  }
}
