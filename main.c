#include <string.h>
#include <stdio.h>

int	my_putchar(char);
int	my_strlen(char *);
int	my_putstr(char *);
int     my_putnbr(int);
int     my_strcmp(char *, char *);

int	main(int ac, char **av)
{
  printf("%d\n", my_strcmp("alors", "alors"));
  printf("%d\n", my_strcmp("alor", "alors"));
  printf("%d\n", my_strcmp("alors", "alor"));

  printf("%d\n", strcmp("alors", "alors"));
  printf("%d\n", strcmp("alor", "alors"));
  printf("%d\n", strcmp("alors", "alor"));
  return (0);
}
