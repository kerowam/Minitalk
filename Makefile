# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gfredes- <gfredes-@student.42malaga.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/08 16:24:34 by gfredes-          #+#    #+#              #
#    Updated: 2023/11/11 00:42:49 by gfredes-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME =

CLIENT = client

CLIENT_BONUS = client_bonus

SERVER = server

SERVER_BONUS = server_bonus

CFLAGS = -Wall -Wextra -Werror

CLEAN = rm -f

SRC_C = client.c

SRC_C_BONUS = client_bonus.c

SRC_S = server.c

SRC_S_BONUS = server_bonus.c

CC = gcc -g

OBJ_C = $(SRC_C:.c=.o)

OBJ_C_BONUS = $(SRC_C_BONUS:.c=.o)

OBJ_S = $(SRC_S:.c=.o)

OBJ_S_BONUS = $(SRC_S_BONUS:.c=.o)

LIBFT = libft/libft.a

all: $(CLIENT) $(SERVER)

$(NAME): all

$(LIBFT):
	make -C ./libft

$(CLIENT): $(LIBFT) $(OBJ_C)
	$(CC) $(CFLAGS) $(SRC_C) $(LIBFT) -o $(CLIENT)

$(SERVER): $(LIBFT) $(OBJ_S)
	$(CC) $(CFLAGS) $(SRC_S) $(LIBFT) -o $(SERVER)

bonus: $(CLIENT_BONUS) $(SERVER_BONUS)

$(CLIENT_BONUS): $(LIBFT) $(OBJ_C_BONUS)
	$(CC) $(CFLAGS) $(SRC_C_BONUS) $(LIBFT) -o $(CLIENT_BONUS)

$(SERVER_BONUS): $(LIBFT) $(OBJ_S_BONUS)
	$(CC) $(CFLAGS) $(SRC_S_BONUS) $(LIBFT) -o $(SERVER_BONUS)
	
clean:
	$(CLEAN) $(OBJ_C) $(OBJ_S) $(OBJ_C_BONUS) $(OBJ_S_BONUS)
	make -C ./libft clean

fclean: clean
	$(CLEAN) $(CLIENT) $(SERVER) $(CLIENT_BONUS) $(SERVER_BONUS)
	make -C ./libft fclean

re: fclean all

.PHONY: all clean fclean re bonus