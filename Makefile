# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: muhakose <muhakose@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/12/04 13:16:16 by muhakose          #+#    #+#              #
#    Updated: 2023/12/14 09:56:59 by muhakose         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

.SILENT:

COLOUR_GREEN = \033[0;32m
COLOUR_RED = \033[0;31m
COLOUR_BLUE = \033[0;34m
COLOUR_END = \033[0m

CC = cc
RM = rm -f
CFLAGS = -Wall -Wextra -Werror

PIPEX_BONUS = bonus/bonus.c
OBJ_BONUS_O = $(PIPEX_BONUS:.c=.o)

PIPEX_MAIN = pipex.c
OBJ_PIPEX_MAIN = $(PIPEX_MAIN:.c=.o)

OBJ = get_adres.c clear.c piper.c utils.c 
OBJ_PIPEX = $(OBJ:.c=.o)

NAME = pipex

LIBFTDIR = libft
LIBFT = $(LIBFTDIR)/libft.a


%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

$(NAME) : $(OBJ_PIPEX) $(OBJ_PIPEX_MAIN) $(LIBFT)
	$(CC) $(CFLAGS) $(OBJ_PIPEX) $(OBJ_PIPEX_MAIN) $(LIBFT) -o $(NAME)
	echo "$(COLOUR_GREEN)Pipex compiled successfully!$(COLOUR_END)"

$(LIBFT):
	make -C $(LIBFTDIR) && make clean -C $(LIBFTDIR)

all : $(NAME)

clean:
	$(RM) $(OBJ_PIPEX)
	$(RM) $(OBJ_BONUS_O)
	$(RM) $(OBJ_PIPEX_MAIN)

fclean: clean
	$(RM) $(NAME)
	make fclean -C $(LIBFTDIR)
	echo "$(COLOUR_BLUE)Pipex cleaned successfully!$(COLOUR_END)"

re: fclean all

bonus: $(OBJ_PIPEX) $(OBJ_BONUS_O) $(LIBFT)
	$(CC) $(CFLAGS) $(OBJ_PIPEX) $(OBJ_BONUS_O) $(LIBFT) -o $(NAME)
	echo "$(COLOUR_GREEN)Pipex bonus compiled successfully!$(COLOUR_END)"

.PHONY: all clean fclean re