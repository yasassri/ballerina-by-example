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
    // Calling the main fuction with ampty args array
    main([]);
    test:assertEquals(5, a[0]);
    test:assertEquals(15, a[1]);
    int[] ia = [1, 3, 5, 6];
    test:assertEquals(ia, a[2]);
    test:assertEquals("cat", a[3]);
}
