# azure-web-app-github-cd

!!! This Demo does not work in the format the code is in. In order for this to work, the application must be stored in the root of the repository !!!

### Description
This project is to deploy an azure web app service which has github continuous deployment enabled. The sample application is a .net 7 sample application created using the below command:

```dotnet new mvc```

### Steps to deploy
1) Create resource group:

```az group create --name csr-dev-uks-rg --location uksouth```

2) Deploy bicep files

```az deployment group create --resource-group csr-dev-uks-rg --template-file ./infra/web-app.bicep --parameters ./infra/parameters/dev.bicepparam```

3) Teardown environment

```az group delete --name csr-dev-uks-rg ```

### Use Cases
- Auto generated environment base on PR
- Developer self service environments for quick tests

### Notes

- Work needs to be done to understand how the authorization works from first time setup. To get working I had to authoraize first manually through the portal, but then subsequent deployments worked.
- 'Microsoft.Web/sites/sourcecontrols@2021-01-01' - Either code configuration or container configuration must be specified.
- The application must run in the root of the repository, there is no way to specify the path i.e. /app
- To access the website you have to add a github provider to the Authentication section of the azure web app.

### After thoughts