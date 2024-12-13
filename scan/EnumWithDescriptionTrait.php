<?php

namespace scan;

trait EnumWithDescriptionTrait
{
	public function description(): string
	{
		return array_search($this, self::DESCRIPTIONS, true);
	}
}