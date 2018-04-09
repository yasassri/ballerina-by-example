import ballerina/test;
import ballerina/io;

any [] a = [];
int count = 0;
 // This is the mock function which will replace the real function
@test:Mock {
    packageName : "ballerina.io" ,
    functionName : "println"
}
public function mockPrint (any s) {
    a [count] = s;
    count++;
}

@test:Config
function testFunc() {
    // Invoking the main function
    main([]);
    test:assertEquals(0, a[0]);
    test:assertEquals(8, a[1]);
    test:assertEquals(23, a[2]);
    test:assertEquals(1000, a[3]);
}
