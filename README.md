# PCF Elastic Runtime Service (ERS) Base Demo
Base application to demonstrate PCF ERS

## Credits and contributions
As you all know, we often transform other work into our own. This is all based from Andrew Ripka's [cf-workshop-spring-boot github repo] (https://github.com/pivotal-cf-workshop/cf-workshop-spring-boot) with some basic modifications. Then forked off of Marcelo Borges' work at https://github.com/Pivotal-Field-Engineering/pcf-ers-demo.

## Introduction
This base application is intended to demonstrate a basic PCF demo and
3 concourse pipelines:

* PCF api, target, login, and push
* PCF environment variables
  * Spring Cloud Profiles
* Scaling, self-healing, router and load balancing
* RDBMS service and application auto-configuration
* Zero Downtime deployment(aka blue/green)
* A/B Deployment
* Canary Deployment

## Getting Started

**Prerequisites**
- [Cloud Foundry CLI](http://info.pivotal.io/p0R00I0eYJ011dAUCN06lR2)
- [Git Client](http://info.pivotal.io/i1RI0AUe6gN00C010l12J0R)
- An IDE, like [Spring Tool Suite](http://info.pivotal.io/f00RC0N0lh01eU21IAJ260R)
- [Java SE Development Kit](http://info.pivotal.io/n0I60i3021AN0JU0le10CRR)
- [Concourse](https://concourse.ci/vagrant.html)

**Building**
```
$ git clone [REPO]
$ cd [REPO]
$ ./mvnw clean install
``` 

### To run the application locally
The application is set to use an embedded H2 database in non-PaaS environments, and to take advantage of Pivotal CF's auto-configuration for services. To use a MySQL Dev service in PCF, simply create and bind a service to the app and restart the app. No additional configuration is necessary when running locally or in Pivotal CF.

In Pivotal CF, it is assumed that a Pivotal MySQL service will be used.

```
$ ./mvnw spring-boot:run
```

Then go to the http://localhost:8090 in your browser

## Concourse Setup - Assumes you are doing a PCF based deployment
- git clone this repo into a new repository. You will need to check in code changes to trigger concourse CI/CD.

- Make sure that you create a ./concourse/parameters.yml file with the following properties:
```
PCF_TARGET_URL: api.run.pivotal.io
PCF_DOMAIN: cfapps.io
PCF_USERNAME: {YOUR USER NAME}
PCF_PASSWORD: {YOUR PASSWORD}
PCF_ORG: {YOUR ORG}
PCF_SPACE: {YOUR SPACE}
APP_NAME: demo-{YOUR APP NAME}
```

- Modify URLs in 'concourse/postman/UAT_pcf-ers-demo-PWS.postman_collection' to match your app name. If you don't do this, your UAT tests will fail in the Canary pipeline.
- Modify manifest.yml. Make sure that the parameters.yml app name matches your app name.

- Run the following commands from the command line
```
fly -t lite login -c http://192.168.100.4:8080
fly -t lite set-pipeline -p pcf-ers-demo -c ./concourse/pipeline.yml -l ./concourse/parameters.yml
fly -t lite unpause-pipeline -p pcf-ers-demo
```

## Demo Flow - Zero Downtime
- Modify 'io.pivotal.pcf.sme.ers.client.ui.controller.AttendeeService.java'. The "go" method has an attribute "appVersion" that is displayed on the http://demo-url.cfapps.io/services page when you click the 'Start Load Test' button.
- Commit and push code change to git.
- Wait for zero downtime to start. With any luck, your app will switch from "1.0" to "2.0" with no errors.

## Demo Flow - Canary
- Run the "canary-push" task in concourse. Will be in the "Canary" pipeline.
- Wait for concourse. With any luck, your app will switch from "2.0" to "CANARY" with no errors.
- UAT test failure could happen if the test request takes longer than 200ms to return. If that happens, explain what the failure path for CANARY is. Notice that even though the deployment failed, the app never threw any errors.

