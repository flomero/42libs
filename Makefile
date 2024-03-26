# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: flfische <flfische@student.42heilbronn.    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/03/26 10:49:23 by flfische          #+#    #+#              #
#    Updated: 2024/03/26 11:51:01 by flfische         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC := cc
CFLAGS := -Wall -Wextra -Werror


################################################################################
###############                  DIRECTORIES                      ##############
################################################################################

INCLUDE_DIRS := ./ get_next_line ft_printf
SRC_DIRS := string mem char_types lst put_utils get_next_line ft_printf
OBJDIR := obj

vpath %.c $(SRC_DIRS)
vpath %.h $(INCLUDE_DIRS)

################################################################################
###############                   C FILES                         ##############
################################################################################

STRING_FILES := ft_atoi.c \
				ft_itoa.c \
				ft_split.c \
				ft_strchr.c \
				ft_strdup.c \
				ft_striteri.c \
				ft_strjoin.c \
				ft_strlcat.c \
				ft_strlcpy.c \
				ft_strlen.c \
				ft_strmapi.c \
				ft_strncmp.c \
				ft_strnstr.c \
				ft_strrchr.c \
				ft_strtrim.c \
				ft_substr.c \
				ft_substr.c \
				ft_tolower.c \
				ft_toupper.c

MEMORY_FILES := ft_bzero.c \
				ft_calloc.c \
				ft_memcpy.c \
				ft_memchr.c \
				ft_memcmp.c \
				ft_memcpy.c \
				ft_memmove.c \
				ft_memset.c

CHAR_FILES := ft_isalnum.c \
				ft_isalpha.c \
				ft_isascii.c \
				ft_isdigit.c \
				ft_isprint.c \
				ft_isspace.c

LIST_FILES := ft_lstadd_back.c \
				ft_lstadd_front.c \
				ft_lstclear.c \
				ft_lstdelone.c \
				ft_lstiter.c \
				ft_lstlast.c \
				ft_lstmap.c \
				ft_lstnew.c \
				ft_lstsize.c

PUT_FILES := ft_putchar_fd.c \
			ft_putendl_fd.c \
			ft_putnbr_fd.c \
			ft_putstr_fd.c

GNL_FILES := get_next_line.c 

PRINTF_FILES := ft_printf.c \
				ft_parse_format.c \
				ft_print_char.c \
				ft_print_string.c \
				ft_print_decnum.c \
				ft_print_num_nopre.c \
				ft_print_pointer.c \
				ft_print_unsigned.c \
				ft_print_hex.c \
				ft_print_percent.c \
				ft_utils.c \
				ft_putnbr_base.c \
				ft_put_utils.c

CFILES := $(STRING_FILES) $(MEMORY_FILES) $(CHAR_FILES) $(LIST_FILES) $(PUT_FILES) $(GNL_FILES) $(PRINTF_FILES)

################################################################################
###############                    O FILES                        ##############
################################################################################
OFILES := $(addprefix $(OBJDIR)/, $(CFILES:%.c=%.o))

################################################################################
###############                   HEADERS                         ##############
################################################################################
NAME := libft.a

all: $(NAME)

$(NAME): $(OBJDIR) $(OFILES)
	ar rcs $(NAME) $(OFILES)

$(OBJDIR)/%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

$(OBJDIR):
	mkdir -p $(OBJDIR)

clean:
	rm -rf $(OBJDIR)

fclean: clean
	rm -f $(NAME)

re:	fclean all

.PHONY: all clean fclean re