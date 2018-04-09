import ballerina/test;
import ballerina/io;

@test:Config
function testFunc() {
    io:println("Any-type Test");
}


endpoint http:ClientEndpoint httpEndpoint { targets:[{ url:eventServiceEP }] };
http:Request req = new;
req.setJsonPayload();
var response = httpEndpoint -> get("/foo/bar", req);

match response {
http:Response resp => {
var jsonRes = resp.getJsonPayload();
match jsonRes {
json payload => return payload;
mime:EntityError err => io:println(err);
}
}
http:HttpConnectorError err => io:println(err);
}

