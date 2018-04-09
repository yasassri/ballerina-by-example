import ballerina/test;
import ballerina/io;

@test:Config
function testFunc() {
    io:println("Any-type Test");
}


endpoint http:ClientEndpoint httpEndpoint { targets:[{ url:eventServiceEP }] };
http:Request req = new;
req.setStringPayload();
var response = httpEndpoint -> get("/", req);

match response {
http:Response resp => {
var jsonRes = resp.setStringPayload();
match jsonRes {
json payload => return payload;
mime:EntityError err => io:println(err);
}
}
http:HttpConnectorError err => io:println(err);
}

