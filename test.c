#include <stdio.h>
#include <stdlib.h>

int	my_putchar(char);
int	my_strlen(char *);
int	my_putstr(char *);
int     my_putnbr(int);

int	main(int ac, char **av)
{
  while (--ac)
    {
      printf(" : %d\n", my_putnbr(atoi(av[ac])));
    }
  return (0);
}
