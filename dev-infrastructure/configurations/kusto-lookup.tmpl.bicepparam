using '../templates/kusto-lookup.bicep'

param kustoName = '{{ .kusto.kustoName }}'

param kustoEnabled = {{ .arobit.kusto.enabled }}

param serviceLogsDatabase = '{{ .kusto.serviceLogsDatabase }}'

param adxDatasourceGeographies = '{{ .monitoring.adxDatasourceGeographies }}'
