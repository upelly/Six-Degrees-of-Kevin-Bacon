*** Settings ***
Library           Collections
Library           RequestsLibrary
Test Timeout      30 seconds

Suite Setup    Create Session    localhost    http://localhost:8080

*** Test Cases ***
#----------------------------PUT Test Cases----------------------------

getOscarActorFail
    ${resp}=    GET On Session    localhost    url=/api/v1/getOscarActor    expected_status=404

addActorPass
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    name=Kevin Bacon    actorId=nm0000102
    ${resp}=    PUT On Session    localhost    /api/v1/addActor    json=${params}    headers=${headers}    expected_status=200

addActorFail
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    nam=Keanu Reeves    actorId=nm0000103
    ${resp}=    PUT On Session    localhost    /api/v1/addActor    json=${params}    headers=${headers}    expected_status=400

addMoviePass
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    name=A Few Good Men    movieId=nm7000001
    ${resp}=    PUT On Session    localhost    /api/v1/addMovie    json=${params}    headers=${headers}    expected_status=200

addMovieFail
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    name=Wizard of Oz    movieID=nm7000002
    ${resp}=    PUT On Session    localhost    /api/v1/addMovie    json=${params}    headers=${headers}    expected_status=400

#Kevin Bacon to A Few Good Men
addRelationshipPass
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    actorId=nm0000102    movieId=nm7000001
    ${resp}=    PUT On Session    localhost    /api/v1/addRelationship    json=${params}    headers=${headers}    expected_status=200

addRelationshipFail
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    actorId=nm0010105    movieId=nm7000001
    ${resp}=    PUT On Session    localhost    /api/v1/addRelationship    json=${params}    headers=${headers}    expected_status=404

#----------------------------Actors Setups----------------------------
actorsSetup1
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    name=Kevin Spacey    actorId=nm0000103   hasOscar=true
    ${resp}=    PUT On Session    localhost    /api/v1/addActor    json=${params}    headers=${headers}    expected_status=200

actorsSetup2
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    name=Tom Holland    actorId=nm0000104
    ${resp}=    PUT On Session    localhost    /api/v1/addActor    json=${params}    headers=${headers}    expected_status=200

actorsSetup3
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    name=Robert Downey Jr.    actorId=nm0000105
    ${resp}=    PUT On Session    localhost    /api/v1/addActor    json=${params}    headers=${headers}    expected_status=200

actorsSetup4
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    name=Tom Cruise    actorId=nm0000106    hasOscar=true
    ${resp}=    PUT On Session    localhost    /api/v1/addActor    json=${params}    headers=${headers}    expected_status=200

actorsSetup5
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    name=Keanu Reeves    actorId=nm0000107    hasOscar=true
    ${resp}=    PUT On Session    localhost    /api/v1/addActor    json=${params}    headers=${headers}    expected_status=200

actorsSetup6
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    name=Natalie Portman    actorId=nm0000108
    ${resp}=    PUT On Session    localhost    /api/v1/addActor    json=${params}    headers=${headers}    expected_status=200

actorsSetup7
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    name=Jennifer Lawrence    actorId=nm0000109
    ${resp}=    PUT On Session    localhost    /api/v1/addActor    json=${params}    headers=${headers}    expected_status=200

actorsSetup8
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    name=Liam Hemsworth    actorId=nm0000110
    ${resp}=    PUT On Session    localhost    /api/v1/addActor    json=${params}    headers=${headers}    expected_status=200

actorsSetup9
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    name=Chris Hemsworth    actorId=nm0000111
    ${resp}=    PUT On Session    localhost    /api/v1/addActor    json=${params}    headers=${headers}    expected_status=200

actorsSetup10
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    name=Christian Bale    actorId=nm0000112    hasOscar=true
    ${resp}=    PUT On Session    localhost    /api/v1/addActor    json=${params}    headers=${headers}    expected_status=200

#----------------------------Movies Setups----------------------------
moviesSetup1
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    name=John Wick    movieId=nm7000002
    ${resp}=    PUT On Session    localhost    /api/v1/addMovie    json=${params}    headers=${headers}    expected_status=200

moviesSetup2
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    name=Hunger Games    movieId=nm7000003
    ${resp}=    PUT On Session    localhost    /api/v1/addMovie    json=${params}    headers=${headers}    expected_status=200

moviesSetup3
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    name=Thor: Love and Thunder    movieId=nm7000004
    ${resp}=    PUT On Session    localhost    /api/v1/addMovie    json=${params}    headers=${headers}    expected_status=200

moviesSetup4
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    name=Mission Impossible    movieId=nm7000005
    ${resp}=    PUT On Session    localhost    /api/v1/addMovie    json=${params}    headers=${headers}    expected_status=200

moviesSetup5
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    name=Spider-Man Homecoming    movieId=nm7000006
    ${resp}=    PUT On Session    localhost    /api/v1/addMovie    json=${params}    headers=${headers}    expected_status=200

#----------------------------Relationships Setups----------------------------
#Tom Cruise to A Few Good Men
relationshipsSetup1
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    actorId=nm0000106    movieId=nm7000001
    ${resp}=    PUT On Session    localhost    /api/v1/addRelationship    json=${params}    headers=${headers}    expected_status=200

#Christian Bale to A Few Good Men
relationshipsSetup2
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    actorId=nm0000112    movieId=nm7000001
    ${resp}=    PUT On Session    localhost    /api/v1/addRelationship    json=${params}    headers=${headers}    expected_status=200

#Tom Cruise to Mission Impossible
relationshipsSetup3
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    actorId=nm0000106    movieId=nm7000005
    ${resp}=    PUT On Session    localhost    /api/v1/addRelationship    json=${params}    headers=${headers}    expected_status=200

#Tom Holland to Mission Impossible
relationshipsSetup4
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    actorId=nm0000104    movieId=nm7000005
    ${resp}=    PUT On Session    localhost    /api/v1/addRelationship    json=${params}    headers=${headers}    expected_status=200

#RDJ to Hunger Games
relationshipsSetup5
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    actorId=nm0000105    movieId=nm7000003
    ${resp}=    PUT On Session    localhost    /api/v1/addRelationship    json=${params}    headers=${headers}    expected_status=200

#Jennifer Lawrence to Hunger Games
relationshipsSetup6
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    actorId=nm0000109    movieId=nm7000003
    ${resp}=    PUT On Session    localhost    /api/v1/addRelationship    json=${params}    headers=${headers}    expected_status=200

#Liam Hemsworth to Hunger Games
relationshipsSetup7
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    actorId=nm0000110    movieId=nm7000003
    ${resp}=    PUT On Session    localhost    /api/v1/addRelationship    json=${params}    headers=${headers}    expected_status=200

#Chris Hemsworth to Thor: Love and Thunder
relationshipsSetup8
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    actorId=nm0000111    movieId=nm7000004
    ${resp}=    PUT On Session    localhost    /api/v1/addRelationship    json=${params}    headers=${headers}    expected_status=200

#Natalie Portman to Thor: Love and Thunder
relationshipsSetup9
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    actorId=nm0000108    movieId=nm7000004
    ${resp}=    PUT On Session    localhost    /api/v1/addRelationship    json=${params}    headers=${headers}    expected_status=200

#Christian Bale to Thor: Love and Thunder
relationshipsSetup10
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    actorId=nm0000112    movieId=nm7000004
    ${resp}=    PUT On Session    localhost    /api/v1/addRelationship    json=${params}    headers=${headers}    expected_status=200

#Tom Holland to Spiderman Homecoming
relationshipsSetup11
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    actorId=nm0000104    movieId=nm7000006
    ${resp}=    PUT On Session    localhost    /api/v1/addRelationship    json=${params}    headers=${headers}    expected_status=200

#RDJ to Spiderman Homecoming
relationshipsSetup12
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    actorId=nm0000105    movieId=nm7000006
    ${resp}=    PUT On Session    localhost    /api/v1/addRelationship    json=${params}    headers=${headers}    expected_status=200

#Chris Hemsworth to Spiderman Homecoming
relationshipsSetup13
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    actorId=nm0000111    movieId=nm7000006
    ${resp}=    PUT On Session    localhost    /api/v1/addRelationship    json=${params}    headers=${headers}    expected_status=200

#Keanu Reeves to John Wick
relationshipsSetup14
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    actorId=nm0000107    movieId=nm7000002
    ${resp}=    PUT On Session    localhost    /api/v1/addRelationship    json=${params}    headers=${headers}    expected_status=200

#Jennifer Lawrence to John Wick
relationshipsSetup15
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    actorId=nm0000109    movieId=nm7000002
    ${resp}=    PUT On Session    localhost    /api/v1/addRelationship    json=${params}    headers=${headers}    expected_status=200

#Kevin Bacon to John Wick
relationshipsSetup16
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    actorId=nm0000102    movieId=nm7000002
    ${resp}=    PUT On Session    localhost    /api/v1/addRelationship    json=${params}    headers=${headers}    expected_status=200

#----------------------------GET Test Cases----------------------------
getActorPass
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${url}=  Set Variable  /api/v1/getActor?actorId=nm0000107
    ${resp}=    GET On Session    localhost    url=${url}    headers=${headers}    expected_status=200
    ${response_json}=    Evaluate    json.loads('''${resp.content}''')    json
    ${expected_json}=    Create Dictionary   actorId=nm0000107   hasOscar=True   movies=['nm7000002']   name=Keanu Reeves

    #Verify each field of the JSON response individually
    Should Be Equal As Strings    ${response_json['actorId']}    ${expected_json['actorId']}
    Should Be Equal As Strings    ${response_json['hasOscar']}    ${expected_json['hasOscar']}
    Should Be Equal As Strings    ${response_json['movies']}    ${expected_json['movies']}
    Should Be Equal As Strings    ${response_json['name']}    ${expected_json['name']}

getActorFail
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${url}=    Set Variable    /api/v1/getActor?actorId=nm0000207
    ${resp}=    GET On Session    localhost    url=${url}    headers=${headers}    expected_status=404

getMoviePass
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${url}=    Set Variable     http://localhost:8080/api/v1/getMovie?movieId=nm7000004
    ${resp}=    GET On Session    localhost    url=${url}    headers=${headers}    expected_status=200
    ${response_json}=   Evaluate    json.loads('''${resp.content}''')    json
    ${expected_json}=   Create Dictionary    actors=['nm0000111', 'nm0000108', 'nm0000112']    movieId=nm7000004     name=Thor: Love and Thunder

    # Verify each JSON field individually
    Should Be Equal As Strings    ${response_json['actors']}    ${expected_json['actors']}
    Should Be Equal As Strings    ${response_json['movieId']}    ${expected_json['movieId']}
    Should Be Equal As Strings    ${response_json['name']}    ${expected_json['name']}


getMovieFail
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${url}=    Set Variable     http://localhost:8080/api/v1/getMovie?movieId=nm7000069
    ${resp}=    GET On Session    localhost    url=${url}    headers=${headers}    expected_status=404


#Bacon Number from Liam Hemsworth
computeBaconNumberPass
    ${resp}=    GET On Session    localhost    url=/api/v1/computeBaconNumber?actorId=nm0000110    expected_status=200
    ${bacon_number}=    Set Variable    ${resp.json()["baconNumber"]}
    Should Be Equal As Integers    ${bacon_number}    2

#Kevin Spacey is not connected to anything so he should fail test
computeBaconNumberFail
    ${resp}=    GET On Session    localhost    url=/api/v1/computeBaconNumber?actorId=nm0000103    expected_status=404

#Bacon Path from Liam Hemsworth
computeBaconPathPass
    ${resp}=    GET On Session    localhost    url=/api/v1/computeBaconPath?actorId=nm0000110    expected_status=200
    ${bacon_path}=    Set Variable    ${resp.json()["baconPath"]}
    Should Be Equal As Strings    ${bacon_path[0]}    nm0000110
    Should Be Equal As Strings    ${bacon_path[1]}    nm7000003
    Should Be Equal As Strings    ${bacon_path[2]}    nm0000109
    Should Be Equal As Strings    ${bacon_path[3]}    nm7000002
    Should Be Equal As Strings    ${bacon_path[4]}    nm0000102

computeBaconNumberPass1
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary   actorId=nm0000102
    ${resp}=    GET On Session    localhost    /api/v1/computeBaconNumber    params=${params}     headers=${headers}    expected_status=200
    Dictionary Should Contain Key    ${resp.json()}    baconNumber
    Dictionary Should Contain Value    ${resp.json()}    ${0}


#Bacon Path from Kevin Spacey
computeBaconPathFail
    ${resp}=    GET On Session    localhost    url=/api/v1/computeBaconPath?actorId=nm0000103    expected_status=404


getOscarActorPass
    ${resp}=    GET On Session    localhost    url=/api/v1/getOscarActor    expected_status=200
    ${actors}=         Set Variable    ${resp.json()["actors"]}
    ${KevinSpacey}=    Set Variable    ${actors}[0]
    ${TomCruise}=      Set Variable    ${actors}[1]
    ${KeanuReeves}=    Set Variable    ${actors}[2]
    ${ChristianBale}=  Set Variable    ${actors}[3]
    Should Be Equal As Strings    ${KevinSpacey["actorId"]}    nm0000103
    Should Be Equal As Strings    ${KevinSpacey["name"]}    Kevin Spacey
    Should Be Equal As Strings    ${TomCruise["actorId"]}    nm0000106
    Should Be Equal As Strings    ${TomCruise["name"]}    Tom Cruise
    Should Be Equal As Strings    ${KeanuReeves["actorId"]}    nm0000107
    Should Be Equal As Strings    ${KeanuReeves["name"]}    Keanu Reeves
    Should Be Equal As Strings    ${ChristianBale["actorId"]}    nm0000112
    Should Be Equal As Strings    ${ChristianBale["name"]}    Christian Bale


