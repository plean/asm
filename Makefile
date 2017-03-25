NASM		:= nasm
CC		:= gcc
RM		:= rm -f

NASMFLAGS	+= -f elf64
NASMFLAGS	+= -g -F dwarf # debug

CFLAGS  	+= -w -Wall -Wextra -fpic
CFLAGS		+= -I./include/ -L./lib/
LDFLAGS		+= -shared

NAME		:= libasm.so

SRC		:= $(addprefix src/, \
		putc.asm \
		puts.asm \
		putnbr.asm \
		strlen.asm \
		strcmp.asm \
		strncmp.asm \
		strcasecmp.asm \
		rindex.asm \
		read.asm \
		write.asm \
		)

MAIN		:= main.c

OBJ		:= $(SRC:.asm=.o)

all: $(NAME)

$(NAME): $(OBJ)
	$(CC) -o $@ $^ $(LDFLAGS)

clean:
	$(RM) $(OBJ)

fclean: clean
	$(RM) $(NAME)
	$(RM) $(LIBNAME)

re: fclean all

%.o: %.asm
	$(NASM) $< $(NASMFLAGS)

.PHONY: all clean fclean re
