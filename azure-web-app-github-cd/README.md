# azure-web-app-github-cd

### Description
This project is to deploy an azure web app service which has github continuous deployment enabled. The sample application is a .net 7 sample application created using the below command:

```dotnet new mvc```

### Steps to deploy
1) Create resource group:

```az group create --name csr-dev-uks-rg --location uksouth```

2) Deploy bicep file
```az deployment group create --resource-group csr-dev-uks-rg --template-file ./infra/web-app.bicep --parameters ./infra/parameters/dev.bicepparam```

3) Teardown environment
```az group delete --name csr-dev-uks-rg ```

### Use Cases
- Auto generated environment base on PR
- Developer self service environments for quick tests

### Notes

- Work needs to be done to understand how the authorization works from first time setup. To get working I had to authoraize first manually through the portal, but then subsequent deployments worked.
- 'Microsoft.Web/sites/sourcecontrols@2021-01-01' - Either code configuration or container configuration must be specified.
- "dotnet new webapp" didn't resolve anything
### After thoughts