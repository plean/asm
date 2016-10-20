#include <stdio.h>

int	my_putchar(char);
int	my_strlen(char *);
int	my_putstr(char *);
int     my_putnbr(int);

int	main(void)
{
  printf(" : %d\n", my_putnbr(10));
  printf(" : %d\n", my_putnbr(-10));
  printf(" : %d\n", my_putnbr(876));
  return (0);
}
