metadata description = 'Creates an Azure Static Web Apps instance.'
param name string
param location string = resourceGroup().location
param tags object = {}

param sku object = {
  name: 'Free'
  tier: 'Free'
}

resource web 'Microsoft.Web/staticSites@2023-01-01' = {
  name: name
  location: location
  tags: tags
  sku: sku
  properties: {
    provider: 'Custom'
    appSettings: {
      HELLO_NAME: 'app settings'
    }
  }

  resource appSettings 'appSettings' = {
    name: 'appsettings'
    properties: {
      HELLO_NAME: 'app settings'
    }
  }
}

output name string = web.name
output uri string = 'https://${web.properties.defaultHostname}'
