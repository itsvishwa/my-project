import ballerina/http;
import ballerina/io;
import ballerina/log;
import vishwa/hello;

listener http:Listener httpDefaultListener = http:getDefaultListener();

service / on httpDefaultListener {
    resource function get hello() returns json|error {
        do {
            log:printInfo("new api called yessss!!!");
            string greeting = hello:hello("Ballerina");
            io:println(greeting);
            return {
                msg: greeting
            };
        } on fail error err {
            return error("unhandled error", err);
        }
    }
}
