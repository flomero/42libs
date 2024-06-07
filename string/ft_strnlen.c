/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strnlen.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: flfische <flfische@student.42heilbronn.    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/06/07 11:10:38 by flfische          #+#    #+#             */
/*   Updated: 2024/06/07 11:11:00 by flfische         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../libft.h"

/**
 * @brief returns the number of characters in the string s, excluding the
 * terminating null byte ('\0'), but at most n. In doing this, ft_strnlen()
 * looks only at the first n characters at s and never beyond s+n.
 * @param s string to count
 * @param n maximum number of characters to count
 * @return the number of characters in the string s, excluding the
 * terminating null byte ('\0'), but at most n
 */
size_t	ft_strnlen(const char *s, size_t n)
{
	size_t	len;

	len = 0;
	while (len < n && s[len] != '\0')
		len++;
	return (len);
}
