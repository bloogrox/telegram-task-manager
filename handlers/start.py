from aiogram import Router, types
from aiogram.filters.command import Command


router: Router = Router()


@router.message(Command("start"))
async def process_start_command(message: types.Message):
    kb = [
        [
            types.KeyboardButton(text="Home"),
        ],
    ]
    keyboard = types.ReplyKeyboardMarkup(
        keyboard=kb,
        resize_keyboard=True,
        # input_field_placeholder=""
    )
    await message.answer("Starting", reply_markup=keyboard)
