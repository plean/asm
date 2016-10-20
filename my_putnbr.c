#include <stdio.h>

int	my_putnbr(int nb)
{
  int	len;

  len = 0;
  if (nb < 0)
    {
      printf("-");
      nb *= -1;
    }
  while (nb)
    {
      len++;
      nb /= 10;
      printf("%c", nb % 10 + 48);
    }
  return (len);
}

int	main(void)
{
  printf(" : %d\n", my_putnbr(10));
  printf(" : %d\n", my_putnbr(-10));
  printf(" : %d\n", my_putnbr(876));
  return (0);
}
