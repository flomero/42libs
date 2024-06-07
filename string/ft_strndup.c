/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strndup.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: flfische <flfische@student.42heilbronn.    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/06/07 11:07:42 by flfische          #+#    #+#             */
/*   Updated: 2024/06/07 11:08:35 by flfische         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../libft.h"

/**
 * @brief allocates sufficient memory for a copy of the string s1,
 * does the copy, and returns a pointer to it.
 * if allocation fails, returns NULL and sets errno to ENOMEM
 * @param s1 string to copy
 * @param n maximum number of characters to copy
 * @return pointer to the copy of s1
 */
char	*ft_strndup(const char *s1, size_t n)
{
	char	*dest;
	size_t	len;

	len = ft_strnlen(s1, n) + 1;
	dest = (char *)malloc(len);
	if (dest == NULL)
	{
		errno = ENOMEM;
		return (NULL);
	}
	ft_strlcpy(dest, s1, len);
	return (dest);
}
