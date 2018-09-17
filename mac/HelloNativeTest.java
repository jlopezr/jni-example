class HelloNative
{
    native public static void hello( );
    native public double average(int a, int b);
    static
    {
        System.loadLibrary( "HelloNative" );
    }
}

class HelloNativeTest
{
    public static void main( String[ ] args )
    {
        HelloNative.hello( );
    }
}
