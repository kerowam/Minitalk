# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gfredes- <gfredes-@student.42malaga.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/08 16:24:34 by gfredes-          #+#    #+#              #
#    Updated: 2023/11/08 18:27:58 by gfredes-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME =

CLIENT = client

SERVER = server

CFLAGS = -Wall -Wextra -Werror

CLEAN = rm -f

SRC_C = client.c

SRC_S = server.c

CC = gcc -g

OBJ_C = $(SRC_C:.c=.o)

OBJ_S = $(SRC_S:.c=.o)

LIBFT = libft/libft.a

all: $(CLIENT) $(SERVER)

$(NAME): all

$(LIBFT):
	make -C ./libft

$(CLIENT): $(LIBFT) $(OBJ_C)
	$(CC) $(SRC_C) $(LIBFT) -o $(CLIENT)

$(SERVER): $(LIBFT) $(OBJ_S)
	$(CC) $(SRC_S) $(LIBFT) -o $(SERVER)


clean:
	$(CLEAN) $(OBJ_C) $(OBJ_S)
	make -C ./libft clean

fclean: clean
	$(CLEAN) $(CLIENT) $(SERVER)
	make -C ./libft fclean

re: fclean all

.PHONY: all clean fclean re