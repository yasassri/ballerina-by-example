import ballerina/test;
import ballerina/io;

any [] a = [];
int counter = 0;
 // This is the mock function which will replace the real function
@test:Mock {
    packageName : "ballerina.io" ,
    functionName : "println"
}
public function mockPrint (any s) {
    a [counter] = s;
    counter++;
}

@test:Config
function testFunc() {
    // Invoking the main function
    main([]);
    test:assertEquals(737100, a[0]);
    test:assertEquals(false, a[1]);
    test:assertEquals(false, a[2]);
    test:assertEquals(true, a[3]);
    //test:assertEquals(16810815, a[4]);
    test:assertEquals(true, a[5]);
    test:assertEquals(true, a[6]);
    test:assertEquals(100, a[7]);
    test:assertEquals(false, a[8]);
    json j = check <json>a[10];
    json j2 = {"test":"123"};
    //test:assertTrue(j.args.test.toString().equals("123"));
    test:assertEquals(true, a[11]);
}