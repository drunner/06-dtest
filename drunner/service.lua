-- drunner service configuration for dtest

function drunner_setup()
   -- addconfig(NAME, DESCRIPTION, DEFAULT VALUE, TYPE, REQUIRED)
   addconfig("PORT","The port to use","8765","port",true)
   addconfig("VIRTUAL_HOST","The virtual hostname","dtest.co.nz","string",true)

   -- addvolume(NAME, [BACKUP], [EXTERNAL])
   addvolume("drunner-${SERVICENAME}-vol1",true,false)
   addvolume("drunner-${SERVICENAME}-vol2",true,false)
   addvolume("drunner-${SERVICENAME}-vol3",true,false)

   -- addcontainer(NAME)
   addcontainer("drunner/baseimage-alpine")

   -- addproxy(VIRTUAL_HOST,HTTP_PORT,HTTPS_PORT)
   addproxy("${VIRTUAL_HOST}","${PORT}","")
end

function checkport(expectedPort)
      p = dconfig_get("PORT")
      if p==expectedPort then
         print("Port is as expected.")
         return 0
      end
      print("Expected port "..expectedPort.." but config says "..p)
      return 1
end

function help()
   return [[
   NAME
      ${SERVICENAME}

   SYNOPSIS
      ${SERVICENAME} configure VARIABLE=VALUE

      ${SERVICENAME} checkport EXPECTEDPORT
         Check the port config var is as expected

   DESCRIPTION
      A simple dService for running a forum.
   ]]
end
