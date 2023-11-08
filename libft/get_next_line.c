/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   get_next_line.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: gfredes- <gfredes-@student.42malaga.com    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/03/29 22:14:01 by gfredes-          #+#    #+#             */
/*   Updated: 2023/08/30 18:57:07 by gfredes-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

char	*get_next_line(int fd)
{
	static char	*stack[4096];
	char		*line;

	line = NULL;
	if (fd < 0 || BUFFER_SIZE <= 0 || read(fd, 0, 0) < 0)
	{
		if (stack[fd])
		{
			free(stack[fd]);
			stack[fd] = NULL;
		}
		return (NULL);
	}
	stack[fd] = ft_reader(fd, stack[fd]);
	if (!stack[fd])
		return (NULL);
	line = make_line(stack[fd]);
	stack[fd] = update_stack(stack[fd]);
	return (line);
}
