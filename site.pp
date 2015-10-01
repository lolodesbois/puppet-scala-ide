# https://gist.githubusercontent.com/indrat/1513071/raw/bd536ce6c684b430facf9dfad8d3c41b97573356/installBundles.sh

node default {
    #include oracle_java
    class { 'oracle_java':
 	type => 'jdk',	
	check_checksum  => false,
	add_alternative => true
    }

    #include eclipse
    class { 'eclipse':
	package	        => 'jee',
        method          => 'download',
        release_name    => 'luna',
        service_release => 'R'
    }

    eclipse::plugin { 'gonsole':
        method      => 'p2_director',
        repository  => 'http://rherrmann.github.io/gonsole/repository/',
        iu => 'com.codeaffine.gonsole'
      }


    eclipse::plugin { 'scala-ide':
        method      => 'p2_director',
        repository  => 'http://download.scala-ide.org/sdk/lithium/e44/scala211/stable/site/',
        iu => 'org.scala-ide.sdt.feature.feature.group'
    }
    eclipse::plugin { 'scala-ide-weaving':
        method      => 'p2_director',
        repository  => 'http://download.scala-ide.org/sdk/lithium/e44/scala211/stable/site/',
        iu => 'org.scala-ide.sdt.weaving.feature.feature.group'
    }
    eclipse::plugin { 'scala-ide-sdt':
        method      => 'p2_director',
        repository  => 'http://download.scala-ide.org/sdk/lithium/e44/scala211/stable/site/',
        iu => 'org.scala-ide.sdt.source.feature.feature.group'
    }
      

    eclipse::plugin { 'm2e':
        method      => 'p2_director',
        repository  => 'http://download.eclipse.org/technology/m2e/releases',
        iu          => 'org.eclipse.m2e.feature.feature.group'
    }
    eclipse::plugin { 'm2eclipse-egit':
        method      => 'p2_director',
        repository  => 'http://repo1.maven.org/maven2/.m2e/connectors/m2eclipse-egit/0.14.0/N/LATEST/',
        iu          => 'org.sonatype.m2e.egit.feature.feature.group'
    }
#    eclipse::plugin { 'm2e-tycho':
#        method      => 'p2_director',
#        repository  => 'http://download.eclipse.org/technology/m2e/releases/',
#        iu => 'org.sonatype.tycho.m2e.feature.feature.group'
#    }
    
    eclipse::plugin { 'm2e-scala':
        method      => 'p2_director',
        repository  => 'http://alchim31.free.fr/m2e-scala/update-site/m2eclipse-scala/',                       
        iu => 'org.maven.ide.eclipse.scala_feature.feature.group'
    }
}
