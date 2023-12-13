from aiogram import Router, types, F


router: Router = Router()


@router.message(F.text.lower() == "home")
async def hone(message: types.Message):
    await message.answer(text="...")
