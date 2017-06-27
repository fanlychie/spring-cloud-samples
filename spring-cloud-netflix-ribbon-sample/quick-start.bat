@echo off

	TITLE Quick Start

	COLOR 3E

	cd %~dp0
	
	echo [INFO]
	echo [INFO] ------------------------------------------------------------------------
	echo [INFO]
	echo [INFO] 正在构建基础模块 . . .
	echo [INFO]
	echo [INFO] ------------------------------------------------------------------------
	echo [INFO]
	
	call mvn -e -ff -N install:install-file -Dfile=pom.xml -DgroupId=${project.groupId} -DartifactId=${project.artifactId} -Dversion=${project.version} -Dpackaging=pom
	
	cd base-module
	
	call mvn -e -ff clean install -Dmaven.test.skip=true
	
	ping -n 2 127.1 > nul
	
	echo [INFO]
	echo [INFO] ------------------------------------------------------------------------
	echo [INFO]
	echo [INFO] 正在构建服务提供者应用 . . .
	echo [INFO]
	echo [INFO] ------------------------------------------------------------------------
	echo [INFO]
	
	cd ../order-service
	
	call mvn -e -ff clean package -Dmaven.test.skip=true
	
	cd target
	
	ping -n 2 127.1 > nul
	
	echo [INFO]
	echo [INFO] ------------------------------------------------------------------------
	echo [INFO]
	echo [INFO] 正在启动服务提供者应用 Client1 . . .
	echo [INFO]
	echo [INFO] ------------------------------------------------------------------------
	echo [INFO]
	
	start "Provider Client1" /min cmd /T:3E /k "java -jar order-service-0.0.1-SNAPSHOT.jar"
	
	ping -n 5 127.1 > nul
	
	echo [INFO]
	echo [INFO] ------------------------------------------------------------------------
	echo [INFO]
	echo [INFO] 正在启动服务提供者应用 Client2 . . .
	echo [INFO]
	echo [INFO] ------------------------------------------------------------------------
	echo [INFO]
	
	start "Provider Client2" /min cmd /T:3E /k "java -Dspring.profiles.active=client2 -jar order-service-0.0.1-SNAPSHOT.jar"
	
	ping -n 5 127.1 > nul
	
	echo [INFO]
	echo [INFO] ------------------------------------------------------------------------
	echo [INFO]
	echo [INFO] 正在构建服务消费者应用 . . .
	echo [INFO]
	echo [INFO] ------------------------------------------------------------------------
	echo [INFO]
	
	cd ../../user-center
	
	call mvn -e -ff clean package -Dmaven.test.skip=true
	
	cd target
	
	ping -n 2 127.1 > nul
	
	echo [INFO]
	echo [INFO] ------------------------------------------------------------------------
	echo [INFO]
	echo [INFO] 正在启动服务消费者应用 . . .
	echo [INFO]
	echo [INFO] ------------------------------------------------------------------------
	echo [INFO]
	
	start "Consumer" /min cmd /T:3E /k "java -jar user-center-0.0.1-SNAPSHOT.jar"
	
	ping -n 5 127.1 > nul
	
	echo [INFO]
	echo [INFO] ------------------------------------------------------------------------
	echo [INFO]
	echo [INFO] 构建完毕！
	echo [INFO]
	echo [INFO] http://localhost:8888/user/orders/1001
	echo [INFO]
	echo [INFO] ------------------------------------------------------------------------
	echo [INFO]

pause