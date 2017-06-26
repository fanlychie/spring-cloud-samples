@echo off

	TITLE autosellrobot install

	COLOR 3E

	cd %~dp0
	
	echo [INFO]
	echo [INFO] ------------------------------------------------------------------------
	echo [INFO]
	echo [INFO] 正在构建服务器端项目 . . .
	echo [INFO]
	echo [INFO] ------------------------------------------------------------------------
	echo [INFO]
	
	cd eureka-server
	
	call mvn -e -ff clean package -Dmaven.test.skip=true
	
	cd target
	
	echo [INFO]
	echo [INFO] ------------------------------------------------------------------------
	echo [INFO]
	echo [INFO] 正在启动服务器 Peer1 . . .
	echo [INFO]
	echo [INFO] ------------------------------------------------------------------------
	echo [INFO]
	
	start /min cmd /k "java -jar eureka-server-0.0.1-SNAPSHOT.jar"
	
	ping -n 5 127.1 > nul
	
	echo [INFO]
	echo [INFO] ------------------------------------------------------------------------
	echo [INFO]
	echo [INFO] 正在启动服务器 Peer2 . . .
	echo [INFO]
	echo [INFO] ------------------------------------------------------------------------
	echo [INFO]
	
	start /min cmd /k "java -jar -Dspring.profiles.active=peer2 eureka-server-0.0.1-SNAPSHOT.jar"
	
	ping -n 5 127.1 > nul
	
	echo [INFO]
	echo [INFO] ------------------------------------------------------------------------
	echo [INFO]
	echo [INFO] 正在启动服务器 Peer3 . . .
	echo [INFO]
	echo [INFO] ------------------------------------------------------------------------
	echo [INFO]
	
	start /min cmd /k "java -jar -Dspring.profiles.active=peer3 eureka-server-0.0.1-SNAPSHOT.jar"
	
	ping -n 5 127.1 > nul
	
	echo [INFO]
	echo [INFO] ------------------------------------------------------------------------
	echo [INFO]
	echo [INFO] 正在构建客户端项目 . . .
	echo [INFO]
	echo [INFO] ------------------------------------------------------------------------
	echo [INFO]
	
	cd ../../order-service
	
	call mvn -e -ff clean package -Dmaven.test.skip=true
	
	cd target
	
	ping -n 5 127.1 > nul
	
	echo [INFO]
	echo [INFO] ------------------------------------------------------------------------
	echo [INFO]
	echo [INFO] 正在启动客户端 Client1 . . .
	echo [INFO]
	echo [INFO] ------------------------------------------------------------------------
	echo [INFO]
	
	start /min cmd /k "java -jar order-service-0.0.1-SNAPSHOT.jar"
	
	ping -n 5 127.1 > nul
	
	echo [INFO]
	echo [INFO] ------------------------------------------------------------------------
	echo [INFO]
	echo [INFO] 正在启动客户端 Client2 . . .
	echo [INFO]
	echo [INFO] ------------------------------------------------------------------------
	echo [INFO]
	
	start /min cmd /k "java -Dspring.profiles.active=client2 -jar order-service-0.0.1-SNAPSHOT.jar"
	
	ping -n 10 127.1 > nul
	
	echo [INFO]
	echo [INFO] ------------------------------------------------------------------------
	echo [INFO]
	echo [INFO] 构建完毕！
	echo [INFO]
	echo [INFO] http://localhost:8761
	echo [INFO]
	echo [INFO] http://localhost:8762
	echo [INFO]
	echo [INFO] http://localhost:8763
	echo [INFO]
	echo [INFO] ------------------------------------------------------------------------
	echo [INFO]

pause