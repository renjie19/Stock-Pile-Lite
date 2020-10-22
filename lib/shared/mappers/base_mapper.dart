abstract class BaseMapper<E,D> {
 E toEntity(D dto, E entity);
 D toDto(E entity);
}