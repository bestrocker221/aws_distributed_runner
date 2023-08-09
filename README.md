# Distribute execution on multiple instances

The main.tf can be modified to choose different lightsail bundles, i.e. `"nano"   = "nano_2_0"`, to see which bundles are available in your zone and what specs they have use:
`aws lightsail get-bundles`
Read more here: https://docs.aws.amazon.com/cli/latest/reference/lightsail/get-bundles.html

Example:
```
aws lightsail get-bundles --region eu-west-1 --query 'bundles[].{price:price,cpuCount:cpuCount,ramSizeInGb:ramSizeInGb,diskSizeInGb:diskSizeInGb,bundleId:bundleId,instanceType:instanceType,supportedPlatforms:supportedPlatforms[0]}' --output table
```
