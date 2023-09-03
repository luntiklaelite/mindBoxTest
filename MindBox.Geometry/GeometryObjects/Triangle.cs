using MindBox.Geometry.Helpers;
using System;

namespace MindBox.Geometry.GeometryObjects
{
    /// <summary>
    /// Класс, описывающий треугольник.
    /// </summary>
    public class Triangle : IGeometry
    {
        /// <summary>
        /// Создание треугольника.
        /// </summary>
        /// <param name="a">Длина стороны A.</param>
        /// <param name="b">Длина стороны B.</param>
        /// <param name="c">Длина стороны C.</param>
        public Triangle(double a, double b, double c)
        {
            Validate(a, b, c);

            A = a;
            B = b;
            C = c;
        }

        /// <summary>
        /// Длина стороны А.
        /// </summary>
        public double A { get; private init; }

        /// <summary>
        /// Длина стороны B.
        /// </summary>
        public double B { get; private init; }

        /// <summary>
        /// Длина стороны C.
        /// </summary>
        public double C { get; private init; }

        /// <summary>
        /// Является ли треугольник прямоугольным.
        /// </summary>
        public bool IsStraight =>
            A * A + B * B == C * C
            || A * A + C * C == B * B
            || C * C + B * B == A * A;

        /// <inheritdoc />
        public double GetArea()
        {
            double halfPerimeter = (A + B + C) / 2d;
            return Math.Sqrt(halfPerimeter * (halfPerimeter - A) * (halfPerimeter - B) * (halfPerimeter - C));
        }

        private static void Validate(double a, double b, double c)
        {
            GeometryHelper.ValidateForPositive(a, nameof(a));
            GeometryHelper.ValidateForPositive(b, nameof(b));
            GeometryHelper.ValidateForPositive(c, nameof(c));

            string longSideExceptionMessage = "Сторона {0} не может быть больше суммы двух других сторон.";

            if (a > b + c)
                throw new ArgumentException(string.Format(longSideExceptionMessage, nameof(a)));

            if (b > a + c)
                throw new ArgumentException(string.Format(longSideExceptionMessage, nameof(b)));

            if (c > a + b)
                throw new ArgumentException(string.Format(longSideExceptionMessage, nameof(c)));
        }
    }
}