@Library('pipelines-shared-libs') _

import com.test.jenkins.GlobalVars
import com.test.jenkins.StartJob

pipeline {
    agent any
    stages {
        stage('Demo') {
            steps {
                echo 'Hello, world'
                sayHello 'Job 0'

                echo 'The value of foo is : ' + GlobalVars.foo

                def startJob = new StartJob();
                startJob.jobname = "Job 1";
                echo 'Before set: ' + startJob.jobname
                startJob.setJobName("Job 2")
                echo 'After set: ' + startJob.jobname
            }
        }
    }
}