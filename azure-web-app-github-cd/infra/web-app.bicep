param project string 
// Parameters
param environment string 
param location string 
param location_shortCode string 
param sku string
param repositoryUrl string 
param netFrameworkVersion string 
param branch string 
param name_prefix string = '${project}-${environment}-${location_shortCode}'
// param name_prefix_no_space string = '${project}${environment}${location_shortCode}'

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
      netFrameworkVersion: netFrameworkVersion
    }
  }
}

resource srcControls 'Microsoft.Web/sites/sourcecontrols@2021-01-01' = {
  parent: appService
  name: 'web'
  properties: {
    repoUrl: repositoryUrl
    branch: branch
    isManualIntegration: false
    isGitHubAction: true
    gitHubActionConfiguration: {
      generateWorkflowFile: true
      isLinux: true
      codeConfiguration: {
        runtimeStack: 'DOTNETCORE'
        runtimeVersion: netFrameworkVersion
      }
    }
  }
}

