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
    main([]);
    test:assertEquals(3, a[0]);
    test:assertEquals(3, a[1]);
    test:assertEquals(10, a[2]);
    test:assertEquals(1, a[3]);
}
