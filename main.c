#include <string.h>
#include <stdio.h>

int	my_putchar(char);
int	my_strlen(const char *);
int	my_putstr(const char *);
int     my_putnbr(int);
int     my_strcmp(const char *, const char *);
char	*my_rindex(const char *s, int c);



int	main(void/* int ac, char **av */)
{
  char *str = my_rindex("abcdefghijklmnopqrstuvwxyz", 'b');
  if (str)
    printf("%s\n", str);
  return (0);
}
