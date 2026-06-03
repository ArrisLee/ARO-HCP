@description('Name of the Kusto cluster to lookup')
param kustoName string

@description('Toggle if instance is expected to exist')
param kustoEnabled bool

@description('Name of the service logs database (pass-through for Scope binding in Ev2)')
param serviceLogsDatabase string = ''

@description('Comma-separated geography allowlist for ADX datasource provisioning (pass-through for Scope binding in Ev2)')
param adxDatasourceGeographies string = ''

resource kusto 'Microsoft.Kusto/clusters@2024-04-13' existing = if (kustoEnabled) {
  name: kustoName
}

output kustoResourceId string = kustoEnabled ? kusto.id : ''
output kustoUri string = kustoEnabled ? kusto.properties.uri : ''
output kustoDataIngestionUri string = kustoEnabled ? kusto.properties.dataIngestionUri : ''
output kustoPrincipalId string = kustoEnabled ? kusto.identity.principalId : ''
output kustoRegion string = kustoEnabled ? kusto.location : ''
output serviceLogsDatabase string = serviceLogsDatabase
output adxDatasourceGeographies string = adxDatasourceGeographies
