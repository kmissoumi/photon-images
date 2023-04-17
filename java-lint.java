java-lint.md

```shell
export OTEL_SDK_DISABLED=false
export LANG=en_US.UTF-8
export MAVEN_OPTS="-XX:+TieredCompilation -XX:TieredStopAtLevel=1"

export SAUCE_REGION="us-west-1"  # because saucedemo doesn't work in eu-central-1 ???

#SAUCE_USERNAME
#SAUCE_ACCESS_KEY
#SAUCE_VISUAL_API_KEY
cd demo-java


mvn dependency:resolve
mvn dependency:go-offline

mvn --projects best-practice dependency:resolve
mvn --projects best-practice dependency:go-offline


mvn test-compile &&  mvn --projects best-practice test-compile

mvn --projects best-practice test -Dtest=DesktopTests
# mvn --projects best-practice test
```