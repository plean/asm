NASM		:= nasm
CC		:= gcc
RM		:= rm -f


NASMFLAGS	+= -f elf64 -g -F dwarf

CFLAGS  	+= -W -Wall -Wextra
#CFLAGS		+= -lmy
CFLAGS		+= -I./include/ -L./lib/

NAME		:= test

SRCS		:= my_putnbr.asm \
		   my_putchar.asm

MAIN		:= main.c

OBJS		:= $(SRCS:.asm=.o)

DEFAULT		:= "\033[00;0m"
GREEN		:= "\033[0;32;1m"
RED		:= "\033[0;31;1m"
CYAN		:= "\033[0;36;1m"

all:		$(NAME)

$(NAME):	$(OBJS)
		$(CC) $(OBJS) -o $(NAME) $(MAIN) $(CFLAGS)
		echo $(CYAN)"Done for $(NAME)"$(DEFAULT)

clean:
		echo $(CYAN)"Cleaning $(NAME) tmp files..." $(DEFAULT)
		$(RM) $(OBJS)

fclean:	clean
		echo $(CYAN)"Cleaning $(NAME) executable..." $(DEFAULT)
		$(RM) $(NAME)

re: fclean all

.c.o:%.c
	@$(CC) -c $< -o $@ $(CFLAGS)  && \
		echo $(GREEN)"[OK]"$(DEFAULT) $< || \
		echo $(RED)"[NOT OK]"$(DEFAULT) $<

%.o: %.asm
	@$(NASM) $< $(NASMFLAGS) && \
		echo $(GREEN)"[OK]"$(DEFAULT) $< || \
		echo $(RED)"[NOT OK]"$(DEFAULT) $<

.PHONY: all clean fclean re

.SILENT: all $(NAME) clean fclean re
