# azure-web-app-github-cd

❗❗❗ This Demo does not work with the current folder structure. In order for this to work, the application must be stored in the root of the repository ❗❗❗

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
- Developer self service environment for quick tests/PoC's.
- When you know you are going to make multiple commits in a short ammount of time and don't want to disrupt wider SDLC.
- Emergency temp solution whilst a more sophisticated solution is being designed and implemented.

### Notes
- Work needs to be done to understand how the authorization works from first time setup. To get working I had to authoraize first manually through the portal, but then subsequent deployments worked.
- 'Microsoft.Web/sites/sourcecontrols@2021-01-01' - Either code configuration or container configuration must be specified.
- The application must run in the root of the repository, there is no way to specify the path i.e. /app
- To access the website you have to add a github provider to the Authentication section of the azure web app.

### After thoughts
- Was overly complicated to setup and a lot of gotcha's involved for first time setup.
- Designed for short lived environments.
- To many complications with Authorization, that you're better off deploying manually.
