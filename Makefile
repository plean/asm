NASM		:= nasm
LD		:= ld
RM		:= rm -f

NASMFLAGS	+= -f elf64
NASMFLAGS	+= -g -F dwarf # debug

LDFLAGS		+= -shared

NAME		:= libasm.so

SRC		:= $(addprefix src/, \
		strlen.asm \
		strcmp.asm \
		rindex.asm \
		strchr.asm \
		memmove.asm \
		strstr.asm \
		memset.asm \
		strncmp.asm \
		strpbrk.asm \
		memcpy.asm \
		strcasecmp.asm \
		strcspn.asm \
		read.asm \
		write.asm \
		putc.asm \
		puts.asm \
		putnbr.asm \
		)

MAIN		:= main.c

OBJ		:= $(SRC:.asm=.o)

all: $(NAME)

$(NAME): $(OBJ)
	$(LD) $(LDFLAGS) -o $@ $^

clean:
	$(RM) $(OBJ)

fclean: clean
	$(RM) $(NAME)
	$(RM) $(LIBNAME)

re: fclean all

%.o: %.asm
	$(NASM) $< $(NASMFLAGS)

.PHONY: all clean fclean re
