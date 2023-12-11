import os
import asyncio
import logging
from aiogram import Bot, Dispatcher
from handlers import router


logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


API_TOKEN = os.environ['API_TOKEN']


async def main():
    logger.info("Starting bot")

    bot: Bot = Bot(token=API_TOKEN)
    dp: Dispatcher = Dispatcher()

    dp.include_router(router)

    await bot.delete_webhook(drop_pending_updates=True)
    await dp.start_polling(bot)


if __name__ == "__main__":
    try:
        asyncio.run(main())
    except (KeyboardInterrupt, SystemExit):
        logger.info("Bot stopped")
