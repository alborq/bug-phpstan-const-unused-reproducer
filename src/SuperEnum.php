<?php

use scan\EnumWithDescriptionTrait;

enum SuperEnum: int
{
	use EnumWithDescriptionTrait;

	case STANDARD = 1;
	case SUPER = 2;

	private const array DESCRIPTIONS = [
		'standard' => self::STANDARD,
		'super' => self::SUPER,
	];
}
