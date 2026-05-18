#include <fcgi_stdio.h>
#include <stdlib.h>

int main(void)
{
    while(FCGI_Accept() >= 0)
    {
        printf("Content-type: text/html\r\nStatus: 200 OK\r\n\r\nHello World! <br/> Part 6!");
    }
    
    return 0 ;
}
