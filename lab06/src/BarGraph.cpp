/*
 * BarGraph.cpp
 *
 *  Created on: 1.2.2016
 *      Author: krl
 */

#include "BarGraph.h"

const uint8_t BarGraph::horizontalMap[8][8] = {
	{0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10},
	{0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18},
	{0x1C, 0x1C, 0x1C, 0x1C, 0x1C, 0x1C, 0x1C, 0x1C},
	{0x1E, 0x1E, 0x1E, 0x1E, 0x1E, 0x1E, 0x1E, 0x1E},
	{0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F}};
const uint8_t BarGraph::verticalMap[8][8] = {
	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1F},
	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1F, 0x1F},
	{0x00, 0x00, 0x00, 0x00, 0x00, 0x1F, 0x1F, 0x1F},
	{0x00, 0x00, 0x00, 0x00, 0x1F, 0x1F, 0x1F, 0x1F},
	{0x00, 0x00, 0x00, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F},
	{0x00, 0x00, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F},
	{0x00, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F},
	{0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F}};

BarGraph::BarGraph(LiquidCrystal *lcd_, int length_, bool vertical_, int x_, int y_, bool cursor_) : lcd(lcd_), length(length_), vertical(vertical_), x(x_), y(y_), cursor(cursor_)
{
	int i;
	if (vertical)
	{
		length = 8;
		for (i = 0; i < 8; i++)
		{
			lcd->createChar(i, (uint8_t *)verticalMap[i]);
		}
		size = 1;
	}
	else
	{
		if (length < 5)
			length = 5;
		for (i = 0; i < 8; i++)
		{
			lcd->createChar(i, (uint8_t *)horizontalMap[i]);
		}
		size = length / 5 + (length % 5 > 0 ? 1 : 0);
	}
	lcd->setCursor(0, 0); // move cursor back to visible area
}

BarGraph::~BarGraph()
{
	// TODO Auto-generated destructor stub
}

void BarGraph::draw(int value)
{
	if (cursor)
	{
		this->lcd->setCursor(x, y);
	}

	if (value < 0)
		value = 0;
	if (value > length)
		value = length;

	if (vertical)
	{
		if (value == 0)
			lcd->write(32);
		else
			lcd->write(value - 1);
	}
	else
	{
		int full = value / 5;
		int rest = value % 5;
		int count = size;
		while (count)
		{
			if (full > 0)
			{
				lcd->write(4);
				full--;
			}
			else if (rest > 0)
			{
				lcd->write(rest - 1);
				rest = 0;
			}
			else
			{
				lcd->write(32);
			}
			count--;
		}
	}
}
