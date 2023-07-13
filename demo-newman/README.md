


### Sauce Orchestrate for Custom Workloads


Run any Non-Webdriver Workload on Sauce Labs!  
- [ ] [Sauce Connect Tunnel](https://docs.saucelabs.com/orchestrate/saucectl-configuration/#tunnel)
- [ ] [Save Test Artifacts](https://docs.saucelabs.com/orchestrate/saucectl-configuration/#artifacts)


Let's use Postman's command-line collector runner [_Newman_](https://github.com/postmanlabs/newman).


```sh
# set the env
export SAUCE_USERNAME=""            # string, sauce labs username
export SAUCE_ACCESS_KEY=""          # string, sauce labs access key
export SAUCE_REGION=""              # string, "us-west-1" or "eu-central-1"

# orchestrate for newman postman collection
saucectl run --config config-demo-newman.yml

# set the runID and pull the console output and uploaded artifacts
# https://docs.saucelabs.com/orchestrate/saucectl-configuration/#saucectl-commands
runID=""
saucectl imagerunner logs ${runID} --region ${SAUCE_REGION} 
saucectl imagerunner artifacts download ${runID} "*" --target-dir artifacts/${runID} --out json --region ${SAUCE_REGION}
```