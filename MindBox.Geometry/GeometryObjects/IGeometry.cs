namespace MindBox.Geometry.GeometryObjects
{
    /// <summary>
    /// Интерфейс для геометрических фигур.
    /// </summary>
    public interface IGeometry
    {
        /// <summary>
        /// Метод для получения площади фигуры.
        /// </summary>
        /// <returns>Площадь фигуры.</returns>
        double GetArea();
    }
}