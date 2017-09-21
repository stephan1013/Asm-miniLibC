##
## Makefile for asm in /home/bibzor/rendu/ASM/asm_minilibc
##
## Made by bibzor
## Login   <sebastien.vidal@epitech.eu>
##
## Started on  Tue Mar 14 14:13:59 2017 bibzor
## Last update Tue Mar 21 14:07:20 2017 stephan
##

NAME		=	libasm.so

SRCS		=	 memmove.asm \
			 strlen.asm \
			 strchr.asm \
			 strstr.asm \
			 memset.asm \
			 rindex.asm \
			 strcmp.asm \
			 strcasecmp.asm \
			 strncmp.asm \
			 memcpy.asm \
			 strpbrk.asm \
			 strcspn.asm

LDFLAGS		=	-shared

LD		=	ld

RM		=	rm -f

OBJS		=	$(SRCS:.asm=.o)

%.o: %.asm
			nasm -o $@ $< -f elf64

all:			$(NAME)

$(NAME):		$(OBJS)
			$(LD) $(LDFLAGS) -o $(NAME) $(OBJS)

clean:
			$(RM) $(OBJS)

fclean:			clean
			$(RM) $(NAME)

re:			fclean all

.PHONY:			all clean fclean re
