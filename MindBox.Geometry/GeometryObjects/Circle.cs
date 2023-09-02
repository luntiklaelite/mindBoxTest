using MindBox.Geometry.Helpers;
using System;

namespace MindBox.Geometry.GeometryObjects
{
    /// <summary>
    /// Класс, описывающий круг.
    /// </summary>
    public class Circle : IGeometry
    {
        private double _radius;

        /// <summary>
        /// Радиус круга.
        /// </summary>
        public double Radius
        {
            get { return _radius; }
            set
            {
                GeometryHelper.ValidateForPositive(value, nameof(Radius));
                _radius = value;
            }
        }

        /// <inheritdoc />
        public double GetArea()
        {
            return Math.PI * Math.Pow(Radius, 2);
        }
    }
}