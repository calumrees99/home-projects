using '../web-app.bicep'

param project = 'csr' 
param environment = 'dev' 
param location = 'uksouth'
param location_shortCode = 'uks'
param sku = 'F1'
param repositoryUrl = 'https://github.com/calumrees99/home-projects'
param netFrameworkVersion = '7.0' 
param branch = 'feature/1-web-app-github-cd'