using System;

namespace MindBox.Geometry.Helpers
{
    /// <summary>
    /// Класс-помощник для работы с геометрией.
    /// </summary>
    internal static class GeometryHelper
    {
        /// <summary>
        /// Метод для проверки на то, что <paramref name="value"/> является положительным.
        /// В случае неудачи выбрасывается ошибка <see cref="ArgumentOutOfRangeException"/>.
        /// </summary>
        /// <param name="value">Значение для проверки</param>
        /// <param name="paramName">Название аргумента из вызывающего метода. Добавляется в исключение.</param>
        internal static void ValidateForPositive(double value, string paramName)
        {
            if (value <= 0)
            {
                throw new ArgumentOutOfRangeException(paramName, "Число должно быть положительным.");
            }
            // возможно ещё стоит сюда добавить проверку isNan, isInfinate.
        }
    }
}