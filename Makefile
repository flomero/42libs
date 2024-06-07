# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: flfische <flfische@student.42heilbronn.    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/03/26 10:49:23 by flfische          #+#    #+#              #
#    Updated: 2024/06/07 11:21:36 by flfische         ###   ########.fr        #
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

STRING_FILES := \
				ft_atod.c \
				ft_atoi.c \
				ft_itoa.c \
				ft_split.c \
				ft_strchr.c \
				ft_strcmp.c \
				ft_strdup.c \
				ft_striteri.c \
				ft_strjoin.c \
				ft_strlcat.c \
				ft_strlcpy.c \
				ft_strlen.c \
				ft_strmapi.c \
				ft_strncmp.c \
				ft_strndup.c \
				ft_strnlen.c \
				ft_strnstr.c \
				ft_strrchr.c \
				ft_strskipif.c \
				ft_strtrim.c \
				ft_substr.c \
				ft_tolower.c \
				ft_toupper.c \
				ft_strdelcpy.c \
				ft_strdeldup.c \
				ft_strdellen.c \

MEMORY_FILES := \
				ft_bzero.c \
				ft_calloc.c \
				ft_memcpy.c \
				ft_memchr.c \
				ft_memcmp.c \
				ft_memmove.c \
				ft_memset.c \
				ft_realloc_str.c

CHAR_FILES := \
				ft_isonly.c \
				ft_isalnum.c \
				ft_isalpha.c \
				ft_isascii.c \
				ft_isdigit.c \
				ft_isprint.c \
				ft_isspace.c

LIST_FILES := \
				ft_lstadd_back.c \
				ft_lstadd_front.c \
				ft_lstclear.c \
				ft_lstdelone.c \
				ft_lstiter.c \
				ft_lstlast.c \
				ft_lstmap.c \
				ft_lstnew.c \
				ft_lstsize.c

PUT_FILES := \
				ft_putchar_fd.c \
				ft_putendl_fd.c \
				ft_putnbr_fd.c \
				ft_putstr_fd.c \
				ft_putstrarr_fd.c \
				ft_putintarr_fd.c

GNL_FILES := get_next_line.c 

PRINTF_FILES := \
				ft_printf.c \
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
OFILES := $(addprefix $(OBJDIR)/, $(CFILES:.c=.o))

################################################################################
###############                   HEADERS                         ##############
################################################################################

HEADERS := libft.h get_next_line.h ft_printf.h

################################################################################
###############                    RULES                          ##############
################################################################################
NAME := libft.a

all: ascii_art $(NAME)


$(NAME): $(OFILES)
	@printf "\n$(YELLOW)Creating $(NAME)$(NC)\n"
	@ar rcs $(NAME) $(OFILES)
# only print if the file was created
	@if [ -f $(NAME) ]; then \
		echo "$(GREEN)$(NAME) created$(NC)"; \
	else \
		echo "$(RED)$(NAME) not created$(NC)"; \
	fi
	@echo "------------------------------------------------"

$(OBJDIR)/%.o: %.c $(HEADERS) | $(OBJDIR)
	@$(eval CURRENT := $(shell echo $$(($(CURRENT) + 1))))
	@$(eval PERCENT := $(shell echo $$(($(CURRENT) * 100 / $(TOTAL_SRCS)))))
	@printf "$(CLEAR_LINE)$(YELLOW)Compiling $(PERCENT)%% [$(CURRENT)/$(TOTAL_SRCS)] $(ITALIC_LIGHT_YELLOW)$<$(NC)"
	@$(CC) $(CFLAGS) -c $< -o $@

$(OBJDIR):
	@echo "$(YELLOW)Creating obj directory$(NC)"
	@mkdir -p $(OBJDIR)

clean:
	@echo "$(RED)Removing $(NAME) object files$(NC)"
	@rm -rf $(OBJDIR)

fclean: clean
	@echo "$(RED)Removing $(NAME)$(NC)"
	@rm -f $(NAME)

re:	fclean all

test: all
	$(CC) $(CFLAGS) main.c $(NAME) -o test
	@echo "$(CYAN)"
	@echo "TESTING LIBFT"
	@echo "$(NC)"
	@./test
	@rm -f test

.PHONY: all clean fclean re ascii_art test

################################################################################
###############              COLORS & DECORATIONS                 ##############
################################################################################
GREEN = \033[0;32m
LIGHT_GREEN = \033[0;92m
RED = \033[0;31m
YELLOW = \033[0;33m
LIGHT_YELLOW = \033[0;93m
ITALIC_LIGHT_YELLOW = \033[3;93m
CYAN = \033[0;36m
NC = \033[0m
CLEAR_LINE = \033[2K\r
ASCII_ART = $(CYAN)

BAR_WIDTH = 50
TOTAL_SRCS = $(words $(CFILES))

ascii_art:
	@echo "------------------------------------------------"
	@echo "$(ASCII_ART)        __   ___ ___ $(NC)"
	@echo "$(ASCII_ART)|    | |__) |__   |  $(NC)"
	@echo "$(ASCII_ART)|___ | |__) |     |  $(NC)"
	@echo "                     "
	@echo "------------------------------------------------"